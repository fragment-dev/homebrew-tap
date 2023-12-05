require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4095.0.0-darwin-x64.tar.gz"
    sha256 "6bb8ee07acbe266cc867b52caee4e50737530f55130657b8c0fb59fed5294c2e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4095.0.0-darwin-arm64.tar.gz"
      sha256 "91811588c5160c7b286d2033e67b29647bbea0fcdcce41a7a9b7a8e826adfe1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4095.0.0-linux-x64.tar.gz"
    sha256 "c8053d6b5ab10d6c8c2c45f42379d2fdff32bdd332c5bb351868edb56e75dc51"
  end
  version "4095.0.0"
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
