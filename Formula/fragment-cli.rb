require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.9-darwin-x64.tar.gz"
    sha256 "901cd67094bcef4d4d433001d4c6d965795a8d40481d5f33264710125d735cc7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.9-darwin-arm64.tar.gz"
      sha256 "8108ca4d98c076d4619f787b74283c6cde7b2ea4784eb504d858f9a4be98f231"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.9-linux-x64.tar.gz"
    sha256 "ceeca90439d858d1778729e3a13ca6099cec76f9b66502582e3e4b2c0e4856c1"
  end
  version "2024.10.9"
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
