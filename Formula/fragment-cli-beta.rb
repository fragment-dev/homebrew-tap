require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6114.0.0-darwin-x64.tar.gz"
    sha256 "ee2256e153cd227fd8587da4e1061633a7f2730de02bdbda2f8309bfac0ef07b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6114.0.0-darwin-arm64.tar.gz"
      sha256 "adb7eb6e49717eff243ba5bd13674cd2a8bc691cd656dc9c2eef0c228a3a6f34"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6114.0.0-linux-x64.tar.gz"
    sha256 "abd91a0b62e1a689550e9dc1c215a533670bc742b3c766242d0a4638d8a104d2"
  end
  version "6114.0.0"
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
