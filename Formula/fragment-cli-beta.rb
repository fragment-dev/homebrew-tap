require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4529.0.0-darwin-x64.tar.gz"
    sha256 "2fcb84801115bea4d2a15a30256c57d6d43b89f9bac6311ee8e7c093d5efd2f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4529.0.0-darwin-arm64.tar.gz"
      sha256 "f9d1b7dda30332531382c82e92a69fd7e9833cc93e63802b9509ea795340453f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4529.0.0-linux-x64.tar.gz"
    sha256 "68ee0771994e4f93b508d1a72c2cad7c3085d744464cb79fba198832e833c78e"
  end
  version "4529.0.0"
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
