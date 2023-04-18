require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2461.0.0-darwin-x64.tar.gz"
    sha256 "8b5135f468045d11ab7bdb2fcc06014b405db18449b42132a60dc8cb6677a2bb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2461.0.0-darwin-arm64.tar.gz"
      sha256 "cf7e60102a1b627a1252c91e1b110464084428dafb6b1cb53fec6a98eb3b6b85"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2461.0.0-linux-x64.tar.gz"
    sha256 "1c6f509840981849960fbe04fa98f18a91c524a77cafe2b6fe72ca5ef23cf46d"
  end
  version "2461.0.0"
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
