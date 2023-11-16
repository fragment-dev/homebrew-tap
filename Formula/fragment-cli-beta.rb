require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4019.0.0-darwin-x64.tar.gz"
    sha256 "4d14ee910b3edc90af5d949c243d231de71e381936969371e96d0e7ddd3e35f4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4019.0.0-darwin-arm64.tar.gz"
      sha256 "2bf058b13d88007b6178d7aa6d0af2a5d875af75c02c75c9c762ab33959ccf72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4019.0.0-linux-x64.tar.gz"
    sha256 "3167fe68e1f6b839e4c1b9eacdbd98695b698debc8fe59246acb713b3704dc86"
  end
  version "4019.0.0"
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
