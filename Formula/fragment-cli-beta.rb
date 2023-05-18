require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2693.0.0-darwin-x64.tar.gz"
    sha256 "0d0f70ef7e5e4c62618c5f1c594f874dc2ca052e78c3e73145582cd584bc0d50"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2693.0.0-darwin-arm64.tar.gz"
      sha256 "f70c3aae57e2955059b4a48e2e524ac74bbca3402095a420d40cdc37e6dd9489"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2693.0.0-linux-x64.tar.gz"
    sha256 "b965ec9df6f9d267a706f1c1adbe6cc42cd42f8f84b89453d3061fc891cad596"
  end
  version "2693.0.0"
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
