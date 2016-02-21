## Abandoned Constraints
---
#### What Are Abandoned Constraints?
Abandoned constraints are those which are uninstalled but not yet deleted from your storyboard/xib file. In the image below note the two constraints which are listed in the "disabled" state. That is, their icon is not as dark as the others.

![unused constraints](https://cloud.githubusercontent.com/assets/4184067/13204307/c01b1cc6-d89a-11e5-90dd-e4f3771e6063.png)

#### How This Script Works
Since storyboard and xib files are really just XML files, they're easy enough to edit from the command line. This script will go through and find all of those constraints which've been "excluded" and remove them. Please note that this script **is destructive**.

#### Usage
1. Clone repo
2. Run `./script.sh <path-to-xcode-project>`

Thats it, the script will report back to STDOUT as it deletes the unused constraints and when its all done you can go into your (hopefully source controlled) project and view a diff of what was deleted (if anything)

#### Twitter
[@peterjfoti](https://twitter.com/peterjfoti)


#### MIT License and Contributions are Welcome!
