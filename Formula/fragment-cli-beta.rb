require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2996.0.0-darwin-x64.tar.gz"
    sha256 "457da01ee8229c9d0236e0852cb837229a87eaad4b08d7a33ea901d57aab0935"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2996.0.0-darwin-arm64.tar.gz"
      sha256 "5bf394524d9a425c35e9451bb2a3396fe45b44dcf514f4da42d66d5203395901"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2996.0.0-linux-x64.tar.gz"
    sha256 "2ae19306edcc4d6f362195e4752fa65ad375879f76bf5e249f587571b8db7173"
  end
  version "2996.0.0"
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
