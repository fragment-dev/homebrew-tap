require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4067.0.0-darwin-x64.tar.gz"
    sha256 "b38bc9eb11fd7b0ab3325c60ef903633521fd603d734c62e4e197930aeb2cb62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4067.0.0-darwin-arm64.tar.gz"
      sha256 "728cdad020c3fbd312b3aeafa7acd36652fa440fd1f94d88efc66bd4ebc7a209"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4067.0.0-linux-x64.tar.gz"
    sha256 "c97b66ad407675b150b971c4127a6b9560cc67a448c37fe8fc160ca17bac38d4"
  end
  version "4067.0.0"
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
