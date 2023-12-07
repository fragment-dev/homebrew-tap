require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4112.0.0-darwin-x64.tar.gz"
    sha256 "8d0e5715c4d362f8fd0b4bb2456598d1da942d43f640643143cdf97bb8b47abf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4112.0.0-darwin-arm64.tar.gz"
      sha256 "a2c53f21e9da9cb6192e7352d179d1a7512a620e3672a3b0138927153e63ca9a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4112.0.0-linux-x64.tar.gz"
    sha256 "af058b899d2c13c96cf9b81e3b4ba994bcbc07f2f094347d543ffb3bbbbb06f0"
  end
  version "4112.0.0"
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
