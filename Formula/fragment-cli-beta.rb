require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5017.0.0-darwin-x64.tar.gz"
    sha256 "6c184923a47319a2a5fa749817ad1d784af30ce53db404aba9a5018b48ac1c39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5017.0.0-darwin-arm64.tar.gz"
      sha256 "dc82cc2f360d3c5f54e7ad3575ebd1a2088f7ad146a16209d2228d8e8b2e5be1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5017.0.0-linux-x64.tar.gz"
    sha256 "61ee3a0e684d5539f87c08d7cb23c47320323e26ebf5e14d90bfa0182a5ac97e"
  end
  version "5017.0.0"
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
