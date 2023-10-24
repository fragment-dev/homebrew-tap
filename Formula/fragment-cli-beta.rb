require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3883.0.0-darwin-x64.tar.gz"
    sha256 "f4d8049b36ece40bf282884694fc9efec38907b82631a0a24ff8c7eac781591d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3883.0.0-darwin-arm64.tar.gz"
      sha256 "16e35ec46b4d08e26dbdf4834186c60de22ff922f9d1b70155076b3ebd7e11dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3883.0.0-linux-x64.tar.gz"
    sha256 "d2b38586fc20da179f67f5a3264396cbf04c99b984aaf4eb975705a0c90a6bec"
  end
  version "3883.0.0"
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
