require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5938.0.0-darwin-x64.tar.gz"
    sha256 "b1a065639216d323791fae3fb2b76bf4055933f95cf7d548367401a2e1cd003e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5938.0.0-darwin-arm64.tar.gz"
      sha256 "cf535e0b95cfa067762b49cac2fc6bef018d40124f53ae63be095402e892621e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5938.0.0-linux-x64.tar.gz"
    sha256 "707f3faf40aedaa9a04494ddcfe53584dd596ffb7e9dbac1aaf228d5911c39b9"
  end
  version "5938.0.0"
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
