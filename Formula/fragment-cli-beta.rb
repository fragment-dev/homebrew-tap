require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2847.0.0-darwin-x64.tar.gz"
    sha256 "b29a3c0e0aaf21172ce819de6addf5d3ab07a4c9c9495fe951491c4e2a1dfd83"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2847.0.0-darwin-arm64.tar.gz"
      sha256 "3de3618745f65522f1c25e9beba39fa35872900f96ebc3369c7ac6a7dcc271a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2847.0.0-linux-x64.tar.gz"
    sha256 "33de05123e7fa407369933c0b4875f7733bf37f3bac3c522c8d4d1f60394509c"
  end
  version "2847.0.0"
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
