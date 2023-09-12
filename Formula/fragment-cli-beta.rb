require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3536.0.0-darwin-x64.tar.gz"
    sha256 "30663e967d2acc9b408e050b673b18f17066d9576a4b4a61578692bc7161bf92"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3536.0.0-darwin-arm64.tar.gz"
      sha256 "e5eaab6f798af9efbe43fb2ae7dca923ef2c7d3ed5c0de35bbe9d9b60c2dc59f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3536.0.0-linux-x64.tar.gz"
    sha256 "bc856e66b85219584087e75bbc44cb30a158537d62821051a6e256265b0e90c7"
  end
  version "3536.0.0"
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
