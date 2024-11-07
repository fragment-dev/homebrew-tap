require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5741.0.0-darwin-x64.tar.gz"
    sha256 "31f3f0dba33eabd2b8ca9c97c3e0e490a1e90e13f59d39d9bc390cbf80ead701"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5741.0.0-darwin-arm64.tar.gz"
      sha256 "6c8ddbb26636b06306f1c10b11ad299a915896e613578fa6037f5af6fb9d3b16"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5741.0.0-linux-x64.tar.gz"
    sha256 "25e320bcbd9971b0ea424148e003ebb4446f71398006bb8004b6bf2462e776f2"
  end
  version "5741.0.0"
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
