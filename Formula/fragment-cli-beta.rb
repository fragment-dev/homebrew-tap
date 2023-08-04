require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3244.0.0-darwin-x64.tar.gz"
    sha256 "59fe3d0a3f3e7eda29280848a64d940c891856f2fc290dd7f63cbfd50583eee3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3244.0.0-darwin-arm64.tar.gz"
      sha256 "2abd702256dabe8dd613feba67ab0aa2f8ec52657d8a8c30c8a03964ed5721b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3244.0.0-linux-x64.tar.gz"
    sha256 "0d3f92ddc4cb5f5f058d1e3207a2536a0224054df68629f3262fac41292f43ba"
  end
  version "3244.0.0"
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
