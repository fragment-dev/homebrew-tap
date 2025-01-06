require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6041.0.0-darwin-x64.tar.gz"
    sha256 "bbadb7940e3192dcf1d38492df6a4c58045609f7eea98418402ff7eb666377e0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6041.0.0-darwin-arm64.tar.gz"
      sha256 "ed4a387dd9fec236425dff8df16a6af17110e72e8544743703ad3011d76e9443"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6041.0.0-linux-x64.tar.gz"
    sha256 "0f731ad7fcc985cfea58bf1e557b8c50f4b6786a369bbc9124a1c5e8c9e7e692"
  end
  version "6041.0.0"
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
