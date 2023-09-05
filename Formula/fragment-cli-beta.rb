require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3477.0.0-darwin-x64.tar.gz"
    sha256 "f581e4b41f893ceeaa9060d5b5244287426042c0d46b06a3cbc90092b978452b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3477.0.0-darwin-arm64.tar.gz"
      sha256 "760be85849415ea95090b738ad3dde517d503b955ba4c9cb3126acc1520360a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3477.0.0-linux-x64.tar.gz"
    sha256 "7abf0925f2b329f620b2539aaaab0258b1bce060cb92dadfe37d29bd162d34f3"
  end
  version "3477.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
