require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4801.0.0-darwin-x64.tar.gz"
    sha256 "4d0299dea92615f5c9fea66195a8c8f195d200fb24ebc80c90f0d427199b25f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4801.0.0-darwin-arm64.tar.gz"
      sha256 "04714ba3df9599fe861de18a1d4fbc4401da6df2a50e49f53967f77de8929455"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4801.0.0-linux-x64.tar.gz"
    sha256 "0e556551f4512b45b791c7c3f2f28f4316ebccff6277ef92b959312ae3729e5b"
  end
  version "4801.0.0"
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
