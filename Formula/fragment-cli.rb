require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.15-darwin-x64.tar.gz"
    sha256 "317435cbb01905a9623145e78ff9f6192f41b84dde04ab0d5a0fe6e4840d2f40"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.15-darwin-arm64.tar.gz"
      sha256 "34dd009ba81761b4181401c54032dad539e51cecebec3d05607b0e553be11b4f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.15-linux-x64.tar.gz"
    sha256 "40c087a13fe10c4298f2abafd47e2a2e0d6b3160b9320c88da869d18ea3172d2"
  end
  version "2025.1.15"
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
