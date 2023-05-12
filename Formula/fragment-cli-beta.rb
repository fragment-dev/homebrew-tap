require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2650.0.0-darwin-x64.tar.gz"
    sha256 "dfd3053218183c0d1f5060c4f76536a97b99dd98dd47d15485203f33254e281f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2650.0.0-darwin-arm64.tar.gz"
      sha256 "fdf6ee42722f91635eb0250721117c5f38063f11218a58568ce82184d74f59ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2650.0.0-linux-x64.tar.gz"
    sha256 "d90b8c9cbe080a5560281c6d733a724f33f91443c3c1239e924a50d19b7fcc1b"
  end
  version "2650.0.0"
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
