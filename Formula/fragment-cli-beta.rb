require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3924.0.0-darwin-x64.tar.gz"
    sha256 "b5c86a558731e30d604985570f1b7ec32a94a33742e5c7159f4596978b8d45ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3924.0.0-darwin-arm64.tar.gz"
      sha256 "55229c1d0130c1a100b9ff9b38ea68d03e422ffb870eb868fe20a563c3b8729f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3924.0.0-linux-x64.tar.gz"
    sha256 "1f0066bdbfa9725195b2558f087ecb7fb4d6e45c39b6b950a19d7d9f150aca9c"
  end
  version "3924.0.0"
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
