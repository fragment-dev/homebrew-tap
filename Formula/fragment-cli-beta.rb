require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6069.0.0-darwin-x64.tar.gz"
    sha256 "955722d9417fdb2192fbd0d5f12aa4c58a1b71533dc43670fcfabbcd82e21d1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6069.0.0-darwin-arm64.tar.gz"
      sha256 "3ad26df836db45f115983297bb8907cc68b19d6961abcfe0411fc215eaad82d7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6069.0.0-linux-x64.tar.gz"
    sha256 "c41c9d87adba73ede36cb102d54c798fe177fb2689a19808520c08fa555e0bc6"
  end
  version "6069.0.0"
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
