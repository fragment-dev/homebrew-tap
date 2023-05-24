require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2737.0.0-darwin-x64.tar.gz"
    sha256 "7673404b2280dc504b62e407e550cde44aaeb45ab394f0d4d9bd7a1ad38e7b04"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2737.0.0-darwin-arm64.tar.gz"
      sha256 "454a3d40018fc02343714f19d347c9246a8ba76ec2d78e7f51f709079250f34d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2737.0.0-linux-x64.tar.gz"
    sha256 "5a102ae320b432103768eae672314b30ea70d7088f46cb22d7b67ab7b2d70591"
  end
  version "2737.0.0"
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
