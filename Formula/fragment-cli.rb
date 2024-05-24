require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.23-1-darwin-x64.tar.gz"
    sha256 "cb9dfa3c54bab7edb09aa4fb639caaa51798d9d3acd8e13541de0f41096047d4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.23-1-darwin-arm64.tar.gz"
      sha256 "04a32c505de6c73908500d9d6f025195b3531124bbe66084015597c58d2a1738"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.23-1-linux-x64.tar.gz"
    sha256 "23bc994f33afcfc4f9b1ac86c8e8d5a55d4686d55b40c21b1580dea0940031bd"
  end
  version "2024.5.23-1"
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
