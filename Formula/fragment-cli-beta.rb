require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4333.0.0-darwin-x64.tar.gz"
    sha256 "2e042534bf5238eb62bf073e4b106e99b53b2f72294dc661b5acf6dddd9d2bb6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4333.0.0-darwin-arm64.tar.gz"
      sha256 "18763372858d77c479cce3a1d7aa9c6f16fee5a45cfe51f6e24cb114d2713429"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4333.0.0-linux-x64.tar.gz"
    sha256 "9f6cd788e66805a2745d1dc9e980b1a42d7b7289efa80f62a61654cd7d42c28a"
  end
  version "4333.0.0"
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
