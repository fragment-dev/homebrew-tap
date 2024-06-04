require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5188.0.0-darwin-x64.tar.gz"
    sha256 "293fea0a4ab9fe1e893afdd97caa34087918904e093fe9fb902ecd8c212be75c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5188.0.0-darwin-arm64.tar.gz"
      sha256 "7311203f52e030788ef8c3d0a94a6a4b4d30227b63b125b182b1306680690a88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5188.0.0-linux-x64.tar.gz"
    sha256 "22925fdaffa859ab0c7fa8ea195c4b4e8acaa55573f67811c48f38c28e5cd043"
  end
  version "5188.0.0"
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
