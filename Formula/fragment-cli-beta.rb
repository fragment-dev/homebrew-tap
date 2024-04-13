require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4890.0.0-darwin-x64.tar.gz"
    sha256 "039835d4e452045b1b65521bd2852ea83a818b5af595be1203f7c13c3d181489"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4890.0.0-darwin-arm64.tar.gz"
      sha256 "5131f23ae06562af3c5c199286c99baa9f45eb66e4bfb37dcdda0fac463ad52e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4890.0.0-linux-x64.tar.gz"
    sha256 "332ea08896dc3407b8fdd5d1ab61bb06658121b1fd7746ce5791980fdba70ee3"
  end
  version "4890.0.0"
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
