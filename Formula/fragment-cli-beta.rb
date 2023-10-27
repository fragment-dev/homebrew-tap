require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3923.0.0-darwin-x64.tar.gz"
    sha256 "db0b00509f0fabc93d52848fe7fee3a5c5c926ed4ff776a4b318d5582a23adda"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3923.0.0-darwin-arm64.tar.gz"
      sha256 "ce33a9cc58708b2492bdba4b14f937a8c3e08485ef2e0736b3ca892a7308de2e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3923.0.0-linux-x64.tar.gz"
    sha256 "5cf113f51bea51ece84d66d9c24a6f86babec0152ac3d568be8a80b559a745b0"
  end
  version "3923.0.0"
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
