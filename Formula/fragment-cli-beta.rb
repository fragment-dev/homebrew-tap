require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5066.0.0-darwin-x64.tar.gz"
    sha256 "1bdb045c4d838aa4fde705b77039970a512889b8aa7787be970c8043f502f1cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5066.0.0-darwin-arm64.tar.gz"
      sha256 "b31531415561004b3ee60b8316031c29417f159353a6b21f530e723c8ee85e3f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5066.0.0-linux-x64.tar.gz"
    sha256 "78d36c3869f6964e484a5f0c933dad56ccdff1e48fc8b4344c7a61c9f93a8599"
  end
  version "5066.0.0"
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
