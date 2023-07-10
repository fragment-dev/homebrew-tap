require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3026.0.0-darwin-x64.tar.gz"
    sha256 "f04c9c92e0494101cc41cd510df36c723aa7ccf9962b4a8d79c82fd1d69024f3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3026.0.0-darwin-arm64.tar.gz"
      sha256 "6e2713b6ac553cc5a0e385128df4de29464ba7d61ebbad01dd3691003da036ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3026.0.0-linux-x64.tar.gz"
    sha256 "a4d08b861a5ad62b081eb53dcc32d6622d760759e9114c92f52036c09d1e2f4e"
  end
  version "3026.0.0"
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
