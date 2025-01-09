require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6058.0.0-darwin-x64.tar.gz"
    sha256 "e737439f415bc3a5799b975843802902a15e2fb1f7c9c44032b3d454cfa82c01"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6058.0.0-darwin-arm64.tar.gz"
      sha256 "22f841ed83ba18863275452e4d3f05cdc92767cd5d615a30d90e38fa72de0dab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6058.0.0-linux-x64.tar.gz"
    sha256 "1954be23c188cb48c1cfb04a39b1d85e2c1324fc17911fe2e569d05c9e248f34"
  end
  version "6058.0.0"
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
