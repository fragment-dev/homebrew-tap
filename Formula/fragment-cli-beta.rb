require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4442.0.0-darwin-x64.tar.gz"
    sha256 "4e57eae7c11f0286d4e105b810a21c013fc267376713383a79dc59e44e390728"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4442.0.0-darwin-arm64.tar.gz"
      sha256 "4b954a4eccc5cfa886a6078a4248d2023aee256eab43574a41720376123cd254"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4442.0.0-linux-x64.tar.gz"
    sha256 "77d4aa477d4a64286082562f1206a82943289cdaefb1ebca96e8f971c496a607"
  end
  version "4442.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
