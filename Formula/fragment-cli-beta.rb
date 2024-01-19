require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4378.0.0-darwin-x64.tar.gz"
    sha256 "75a363dfbab552cfdbeddc5715e61b5d0e4a6a13ddddf3c8ae9cbfd0608455c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4378.0.0-darwin-arm64.tar.gz"
      sha256 "58753f1db693cdf7ef9d56760e5fadcfffa61fc5eb3290991c3cf3e2f8f7cb1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4378.0.0-linux-x64.tar.gz"
    sha256 "da49fdd283e31fd8d07150a5c47c4dbd6fd124522bddb9ea790def4f6cd8e7d5"
  end
  version "4378.0.0"
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
