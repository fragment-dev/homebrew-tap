require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4483.0.0-darwin-x64.tar.gz"
    sha256 "21b2c83c43680e492ec213292276b2ad3abad2aa7f5baf9632a2334a64861710"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4483.0.0-darwin-arm64.tar.gz"
      sha256 "ff5ec77d3711cf5689674431eefebfe5dd788092ff9a3acd118867e2431159af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4483.0.0-linux-x64.tar.gz"
    sha256 "979c3f0148e2f2ae57620e96741d91205d810e15dd24626d277946c4bb67a1ca"
  end
  version "4483.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
