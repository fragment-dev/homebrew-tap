require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5682.0.0-darwin-x64.tar.gz"
    sha256 "820aa2b798fbd5b0ec77065bf88ff5cfdf237a2ef6b86862c2a8ac4d5c551db2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5682.0.0-darwin-arm64.tar.gz"
      sha256 "95f068ba479f7c3ca1bcc7f4e9251a5849dd2e482b6d84cb3ac3bf9f8e379289"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5682.0.0-linux-x64.tar.gz"
    sha256 "44076dd4cea9eb35c6783b37fd7ce0a73da0a59ebda6f742127c481afa953f41"
  end
  version "5682.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
