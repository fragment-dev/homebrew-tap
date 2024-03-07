require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4722.0.0-darwin-x64.tar.gz"
    sha256 "903227814c2d6d01103cd00498124fa7c9703248b9aa34a6b5f3b4da8b57067d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4722.0.0-darwin-arm64.tar.gz"
      sha256 "217288e01e01d0bbbb2ec22cac1fac709f843a19bde939e42658df2c9df01fc9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4722.0.0-linux-x64.tar.gz"
    sha256 "573e0280343f50aba8b71c0ad60075dab9e380be32bb29f1a6f9306247f16d77"
  end
  version "4722.0.0"
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
