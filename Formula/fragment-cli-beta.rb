require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5791.0.0-darwin-x64.tar.gz"
    sha256 "b30625752eb12d423170a421e91202a334d4e779c1ee4200604577c97dfeb3e0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5791.0.0-darwin-arm64.tar.gz"
      sha256 "ba310ddfdfd04c57a2db427ea89a5fa6e08ef56558f831d53b93fbc2ddde754b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5791.0.0-linux-x64.tar.gz"
    sha256 "223954dfc7d7bcb0d5fef9c55ff6b931922adf2f728e9bd36ef94f97c5f40338"
  end
  version "5791.0.0"
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
