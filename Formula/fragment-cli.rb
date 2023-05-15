require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.15-darwin-x64.tar.gz"
    sha256 "8511ddd8f33fb8c549bbe5eeb2055c888a9a0b32f9e5d29163c1162aac266a1c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.15-darwin-arm64.tar.gz"
      sha256 "c9a3a6b84ed1345fa543eb6f80bf8e68fd346d65af117eb71b2c23d48ec8ec44"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.15-linux-x64.tar.gz"
    sha256 "7a287fba8ed28294a802679e41270926c846d5b07b38c4be2393b3d8a5d699ec"
  end
  version "2023.5.15"
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
