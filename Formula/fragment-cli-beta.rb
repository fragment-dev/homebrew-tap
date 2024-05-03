require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4999.0.0-darwin-x64.tar.gz"
    sha256 "b683230cb668995c8a89b6959e714cb711cc1565127b3e00cc19e078ea9ab947"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4999.0.0-darwin-arm64.tar.gz"
      sha256 "99e00ece4f8203cf75a82497a97f36db82be8e385e9fe9d80114a60c032ac9ba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4999.0.0-linux-x64.tar.gz"
    sha256 "b18a0dd6634ef0c41b0919036e2157f1a1a404d91fae19030591a46640121127"
  end
  version "4999.0.0"
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
