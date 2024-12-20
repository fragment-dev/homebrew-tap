require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5950.0.0-darwin-x64.tar.gz"
    sha256 "7c11a5f7f9410d51f4f6bdefe451e299bee84eb8a34a56e2f4a44c8408978e45"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5950.0.0-darwin-arm64.tar.gz"
      sha256 "27c5255e1d03cd92f4a033a9ae08205515bfa1b18305bd58f9e2b97dd6ea0ce4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5950.0.0-linux-x64.tar.gz"
    sha256 "4213852b43ffc3b2b98023c112a54cd2531fc289e2d0221024da9caef54239b9"
  end
  version "5950.0.0"
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
