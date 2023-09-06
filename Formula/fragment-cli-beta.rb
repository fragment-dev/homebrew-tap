require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3493.0.0-darwin-x64.tar.gz"
    sha256 "727ca0dd1f70fa88debf7577b134dda2cb217c539c65ff28e29693da4cfbaafb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3493.0.0-darwin-arm64.tar.gz"
      sha256 "3550925242d9d7b71a494b9d91d4a7305bb9f6d773da1d1f1fc4db213420cf6e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3493.0.0-linux-x64.tar.gz"
    sha256 "7994c483e9452e2224045c5103330f2cfc087465fecae60372ce62e2c7488b32"
  end
  version "3493.0.0"
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
