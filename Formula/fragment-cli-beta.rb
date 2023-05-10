require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2618.0.0-darwin-x64.tar.gz"
    sha256 "bab905ce9778c0a2a6a230993ec954d9209333c036b6deba246e7ce8c2edfda8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2618.0.0-darwin-arm64.tar.gz"
      sha256 "48bee7cfbebb779a871f33851b032fcd660487801c8abd13b8d7c03bc8e0aee6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2618.0.0-linux-x64.tar.gz"
    sha256 "6693f91b3d6bb52daab6e6d99f2ede6fb6efcd9978b4f111a990c1d57c7f310b"
  end
  version "2618.0.0"
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
