require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5370.0.0-darwin-x64.tar.gz"
    sha256 "d8611eff6f743ebac186e6fafe6806a70781ea4fae9c60220e531c3b7286aaec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5370.0.0-darwin-arm64.tar.gz"
      sha256 "d06ebc0f2c3cc41f27e5de744ad4da52d87e723e58198424fe867705c7e6a967"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5370.0.0-linux-x64.tar.gz"
    sha256 "08c5fd69c60e448441073d4647c014664afb3d924023ac778e0b8f517408de1f"
  end
  version "5370.0.0"
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
