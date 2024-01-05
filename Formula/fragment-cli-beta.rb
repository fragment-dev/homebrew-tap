require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4274.0.0-darwin-x64.tar.gz"
    sha256 "ab9f4b9b344f395bc92ca4b01c1d1a47d72e3c260b98453e11b0e6c183d716c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4274.0.0-darwin-arm64.tar.gz"
      sha256 "07eeed8efe7690d043db619ef833a3707ba8039a2eb65f2529d641fa2298e756"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4274.0.0-linux-x64.tar.gz"
    sha256 "44f15050ff2374d933254f7c9645e38c5ed23e317e767318892631504b9c03f4"
  end
  version "4274.0.0"
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
