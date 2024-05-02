require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4991.0.0-darwin-x64.tar.gz"
    sha256 "92d8ac793479d8b907c07d176b4a2a2e76c2bdd082351df7715b4262c6770585"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4991.0.0-darwin-arm64.tar.gz"
      sha256 "55f22076a5bdead6492537b72b087c4910b4b0802bd96da9558c4fb3373bbafc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4991.0.0-linux-x64.tar.gz"
    sha256 "53bfe137cac86521510f52f08321924e4f8c3f9158251f46ee46767cd1e77403"
  end
  version "4991.0.0"
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
