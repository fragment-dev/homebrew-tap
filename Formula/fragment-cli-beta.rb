require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5600.0.0-darwin-x64.tar.gz"
    sha256 "f624557c13fcfe0cb63b705a6f7f4388311f95e763959adbefd4d5ba23fab5d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5600.0.0-darwin-arm64.tar.gz"
      sha256 "a96787109236737f3b4115f1b172a5bd93ba20ff4b24db2dfda2e8fe5f27493d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5600.0.0-linux-x64.tar.gz"
    sha256 "8c6e9b66135cdd8e152804f8c4b70eb8fdf1d2ab90a7483f465e42dcdd11aca3"
  end
  version "5600.0.0"
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
