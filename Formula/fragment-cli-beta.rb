require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3657.0.0-darwin-x64.tar.gz"
    sha256 "65064467d6c34bec25d73fbe87eb9d52a0f5a280b686de0ba11d9a7557e41a99"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3657.0.0-darwin-arm64.tar.gz"
      sha256 "fdb05606bd403f833468dec238ac2bb6182d177cb1d9947c3a8c41b7e78d8d10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3657.0.0-linux-x64.tar.gz"
    sha256 "cc727b6bb43d48d6349c0a4bad147e5feab0c363075e8d46cc587af2ef47de48"
  end
  version "3657.0.0"
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
