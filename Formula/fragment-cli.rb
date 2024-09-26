require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.25-darwin-x64.tar.gz"
    sha256 "dbf4e11a58cf1dd682da5313e1dca9af70c5a04a49a5ed1229054b55a22af2e9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.25-darwin-arm64.tar.gz"
      sha256 "47462378877a2ff24fb2681fe15e6627e9ab10b4357414e04a9db62cb1f42624"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.25-linux-x64.tar.gz"
    sha256 "f2ba580cadb5f5f6cdcdcf952acf21de3ef0815ccdb41ca694ca3720df9d9fcc"
  end
  version "2024.9.25"
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
