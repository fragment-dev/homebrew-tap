require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2356.0.0-darwin-x64.tar.gz"
    sha256 "ae56fc0c86cb9859b32b4d491729cf5ecbabf8d319b9204313af1bb5f1cc08d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2356.0.0-darwin-arm64.tar.gz"
      sha256 "8cf03a16e40acc9e4f3a04da7c5c83c904e0fd0a38ccbb8327763dc38ad89ee5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2356.0.0-linux-x64.tar.gz"
    sha256 "9bcc8fb222f767d2c92e55db9bc274c7671938b4b078d978f456979f74aa9c06"
  end
  version "2356.0.0"
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
