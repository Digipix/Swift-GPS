//
//  FileListViewController.swift
//  Swift GPS
//
//  Created by Venj Chu on 14/6/12.
//  Copyright (c) 2014年 Venj Chu. All rights reserved.
//

import UIKit

class FileListViewController: UITableViewController {

    var files: Array<String>!

    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
//    init(coder aDecoder: NSCoder!)  {
//        super.init(coder:aDecoder)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Helper
    
    func dataFiles() -> Array<String> {
        let fm = NSFileManager()
        let dirEnum = fm.enumeratorAtPath(UserDocumentPath())
        var fileArray = Array<String>()
        while let file = dirEnum.nextObject() as? String {
            if file.pathExtension == "txt" {
                fileArray.append(UserDocumentPath().stringByAppendingPathComponent(file))
            }
        }
        
        return fileArray
    }
    
    @IBAction func refreshFileList(sender: AnyObject!) {
        files = dataFiles()
        tableView.reloadData()
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return files.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("FileNameIdentifier", forIndexPath: indexPath) as UITableViewCell
        // Configure the cell...
        cell.textLabel.text = files[indexPath!.row].lastPathComponent

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let fileName = tableView!.cellForRowAtIndexPath(indexPath!).textLabel.text
            if fileName {
                let filePath = UserDocumentPath().stringByAppendingPathComponent(fileName)
                let fm = NSFileManager()
                var isDirectory: CMutablePointer<ObjCBool>
                if fm.fileExistsAtPath(filePath, isDirectory:isDirectory) {
                    if isDirectory == false {
                        
                    }
                }
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
