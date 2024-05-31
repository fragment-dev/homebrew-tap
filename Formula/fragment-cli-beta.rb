require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5158.0.0-darwin-x64.tar.gz"
    sha256 "0e6d746947860abb1677dd6129fc84ca0a8a493c340952dc5b68a5641c5e844b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5158.0.0-darwin-arm64.tar.gz"
      sha256 "4626c13d08b07fd7577cb3c354feccd460b057a66e14fb20369a1f3d68d477db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5158.0.0-linux-x64.tar.gz"
    sha256 "640569dcf5f38800b1d6cd3b470f1f4723aceefa993c9a8dbbc09053d3884971"
  end
  version "5158.0.0"
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
