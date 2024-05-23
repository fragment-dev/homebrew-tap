require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5108.0.0-darwin-x64.tar.gz"
    sha256 "7e2bacb289947ab4ad475ac6c77e1f23cc7203bd29af49b5920bc97b9527a959"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5108.0.0-darwin-arm64.tar.gz"
      sha256 "07ad32e56139aa941a6ad204fc1aec5d9d8a2f8a3f5f337480f1b299bc706724"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5108.0.0-linux-x64.tar.gz"
    sha256 "88bb42d775832af81f80725b1e78a3014a08757df17c6e48a3c9171c35a80524"
  end
  version "5108.0.0"
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
